struct S1 { a: Int }
struct S2 { b: Bool }
struct S3 { c: String }

contract TestContract {
    one: S1;
    two: S2;
    three: S3;

    init() {
        self.one = S1{ a: 7 };
        self.two = S2{ b: true };
        self.three = S3{ c: "foo" };
    }
}