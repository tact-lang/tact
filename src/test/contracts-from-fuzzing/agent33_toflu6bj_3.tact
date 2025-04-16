struct OptInner { val: Int; }
struct Container { x: Int; y: OptInner?; }

contract TestContract {
    myField: Container;

    init() {
        self.myField = Container{ x: 7, y: null };
    }
}