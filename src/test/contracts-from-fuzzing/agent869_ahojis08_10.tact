struct OptionalNest1 { 
    flag: Bool?;
    txt: String?;
}

struct OptionalNest2 {
    opt: OptionalNest1?;
    number: Int;
}

contract TestContract {
    val: OptionalNest2;

    init() {
        self.val = OptionalNest2{
            opt: OptionalNest1{
                flag: null,
                txt: "abc"
            },
            number: 77
        };
    }
}