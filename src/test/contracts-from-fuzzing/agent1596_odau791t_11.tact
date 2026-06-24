struct NestedOptionals {
    x: Int?;
    y: Bool?;
    z: String?;
}

struct HasNestedOptionals {
    inner: NestedOptionals?;
    val: Int;
}

contract NestedOptionalsTest {
    f: HasNestedOptionals = HasNestedOptionals{
        inner: null,
        val: 7
    };

    receive() {
        let _ = self.f.val;
    }
}