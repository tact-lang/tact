struct NestedOptions {
    f1: Int?;
    f2: String?;
}

struct ContainsNestedOpt {
    val: NestedOptions?;
}

contract TestContract {
    data: ContainsNestedOpt;
    init(){
        self.data=ContainsNestedOpt{
            val: NestedOptions{
                f1: null,
                f2: "hi"
            }
        };
    }
}