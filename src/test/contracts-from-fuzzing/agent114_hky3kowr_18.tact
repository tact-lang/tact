struct OptDeep2 { innerOpt: Int?; }
struct OptDeep1 { sub: OptDeep2?; }

contract NullableDeep {
    val: OptDeep1;

    init() {
        self.val = OptDeep1{
            sub: null,
        };
    }
}