struct Point {
    x: Int;
    y: Int;
}

struct MaybePointHolder {
    point: Point?;
}

contract C {
    nested: MaybePointHolder;

    init() {
        self.nested = MaybePointHolder{
            point: null
        };
    }
}