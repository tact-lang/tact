struct MaybeData { q: Int; r: String; }

contract OptionalStructField {
    m: MaybeData?;

    init() {
        self.m = null;
    }
}