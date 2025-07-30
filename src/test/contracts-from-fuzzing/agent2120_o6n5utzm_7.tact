struct NestedA { foo: Int; bar: String; flag: Bool; }
struct NestedB { a: Int; b: NestedA; optFoo: Int?; s: String; }

contract ComplexLayout {
    data: NestedB;
    init() {
        self.data = NestedB{
            a:0,
            b: NestedA{ foo:1, bar:"bar", flag:true },
            optFoo: null,
            s:"hello"
        };
    }
}