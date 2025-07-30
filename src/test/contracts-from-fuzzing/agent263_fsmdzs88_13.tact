struct SLev2 { y: Int }
struct SLev1 { s2: SLev2 }

contract MultiNestedNoOpts {
    data: SLev1;

    init() {
        self.data = SLev1{s2: SLev2{y: 777}};
    }
}