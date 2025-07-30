struct Struct1 { a: Int }
struct Struct2 { b: Bool }

contract TwoStructs {
    one: Struct1;
    two: Struct2;

    init() {
        self.one = Struct1{a:123};
        self.two = Struct2{b:true};
    }
}