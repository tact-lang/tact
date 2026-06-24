struct Foo { x: Int; y: Bool; }
struct Bar { message: String; ok: Bool; }

contract TestContract {
    num: Int = 0;
    yes: Bool = true;
    foo: Foo;
    bar: Bar;

    init() {
        self.num = 42;
        self.yes = false;
        self.foo = Foo{x:1,y:true};
        self.bar = Bar{message:"hi",ok:false};
    }
}