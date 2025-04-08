struct DeeperLevel {
    c: Int = 3;
}

struct InnerLevel {
    b: Int = 2;
    deeper: DeeperLevel;
}

struct ThreeLevels {
    a: Int = 1;
    inner: InnerLevel;
}

contract NamedNestedStructTest {
    val: ThreeLevels = ThreeLevels{
        inner: InnerLevel{
            deeper: DeeperLevel{}
        }
    };

    receive() {
        let _ = self.val.inner.deeper.c;
    }
}