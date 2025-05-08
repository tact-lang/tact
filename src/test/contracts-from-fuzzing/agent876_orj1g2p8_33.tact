struct Point { x: Int as int64; y: Int as int64 }

contract OptionWithSerialization {
    loc: Point?;

    init() {
        self.loc = null;
    }
}