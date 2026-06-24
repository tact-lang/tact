// deep nested optional booleans
struct OptBool1 { b: Bool? }
struct OptBool2 { o1: OptBool1? }
struct OptBool3 { o2: OptBool2? }
struct OptBool4 { o3: OptBool3? }

contract TestContract {
    nestedOpt: OptBool4;

    init() {
        self.nestedOpt = OptBool4{ o3: null };
    }

    receive() {}
}