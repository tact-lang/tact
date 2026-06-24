struct DVals {
    x: Int = 10;
    y: Bool = true;
    s: String = "zz";
}

contract TestContract {
    data: DVals;
    init() {
        self.data = DVals{ x:100, y:false, s:"yy" };
    }
}