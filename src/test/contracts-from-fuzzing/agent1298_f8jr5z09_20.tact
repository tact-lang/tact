struct Foo { a: Int; b: Bool; c: String; }

contract DefaultsVsSet {
    x: Foo = Foo{a:1, b:true, c:"x"};
    init() {
        self.x = Foo{a:42, b:false, c:"y"};
    }
}