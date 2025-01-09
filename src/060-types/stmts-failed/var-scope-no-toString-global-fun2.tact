primitive Int;

struct WrappedInt { x: Int }

extends fun toString(self: WrappedInt): Int {
    return toString(self.x);
}

