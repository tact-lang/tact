struct Foo { x: Int; }
struct Bar { y: String; }
struct Baz { z: Bool; }

contract TestContract {
    fooOpt: Foo?;
    barOpt: Bar?;
    bazOpt: Baz?;

    init() {
        self.fooOpt = null;
        self.barOpt = null;
        self.bazOpt = null;
    }
}