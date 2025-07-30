struct Wrapped {
    a:Int;
    b:Bool;
}
struct Container {
    wrapped: Wrapped?;
    x:Int;
    y:Bool?;
}

contract TestContract {
    data: Container;

    init() {
        self.data = Container {
            wrapped: null,
            x:42,
            y:true
        };
    }
}