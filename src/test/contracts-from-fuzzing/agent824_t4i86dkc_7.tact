struct ManyOptionals {
    o1: Int?;
    o2: String?;
    o3: Bool?;
    o4: Address?;
}

contract TestContract {
    opt: ManyOptionals;

    init() {
        self.opt = ManyOptionals{
            o1: null,
            o2: null,
            o3: true,
            o4: null,
        };
    }
}