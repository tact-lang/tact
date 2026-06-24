struct Person {
  name: String; 
  age: Int; 
  address: String?;
}

struct Company {
  ceo: Person;
  cto: Person?;
  name: String; 
}

contract ComplexNested {
  corp: Company;

  init() {
    self.corp = Company{
      ceo: Person{
        name: "CEO", 
        age: 45,
        address: null,
      },
      cto: null,
      name: "MyCompany"
    };
  }
}