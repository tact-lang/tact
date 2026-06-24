struct A1 { a: Int }
struct B1 { a: Int }

contract SameFieldsName {
    a: A1;
    b: B1;

    init() {
        self.a = A1{a:1};
        self.b = B1{a:2};
    }
}
