primitive Int;

struct IntWrapper { x: Int }

extends mutates fun foo(self: IntWrapper) {
    self.x = 42
}

extends mutates fun bar(self: Int) {
    self = 42
}
