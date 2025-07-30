struct PrimitiveOpt { x: Int? }

contract SerializeOpt {
    v: PrimitiveOpt;

    init() {
        self.v = PrimitiveOpt{ x: null };
    }
}