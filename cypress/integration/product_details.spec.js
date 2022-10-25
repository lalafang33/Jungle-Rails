
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

  it("Should show product detail", () => {
    cy.get(".products article").first().click();
    cy.contains("The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas. It blooms once a year, for 2 weeks.")
  })

})

