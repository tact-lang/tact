struct Org {
  id: Int;
  active: Bool;
}

struct Dept {
  code: Int;
  org: Org;
}

struct Employee {
  empId: Int;
  dept: Dept;
}

contract NestedOrg {
  e: Employee;

  init() {
    self.e = Employee{
      empId:123,
      dept: Dept{
        code:456,
        org: Org{
          id:789,
          active:true,
        },
      },
    };
  }
}