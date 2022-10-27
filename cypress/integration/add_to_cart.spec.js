
describe("product detail", () => {
  beforeEach(() => {
   cy.visit("/");
  });

  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
    
  });
  
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  it("Can add to cart and cart increases by 1", () => {
    cy.get(".products article").first()
    cy.contains("Add").click({force: true})
    cy.contains("My Cart (1)")
  })

})