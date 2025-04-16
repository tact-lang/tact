struct OptionalDeep {
    x: Int?;
    y: Bool?;
}

struct Wrap1 {
    val: OptionalDeep;
}

struct Wrap2 {
    inner: Wrap1;
}

contract TestContract {
    stateData: Wrap2;

    init() {
        self.stateData = Wrap2{
            inner: Wrap1{
                val: OptionalDeep{ x:null, y:true }
            }
        };
    }
}