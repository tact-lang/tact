// try a contract persistent variable with optional nested nullable struct (2 levels)
struct L2Opt {
    val: Int?;
}

struct TopOpt {
    inner: L2Opt?;
}

contract MultiOptStruct {
    state: TopOpt;

    init() {
        self.state = TopOpt{ inner: null };
    }
}