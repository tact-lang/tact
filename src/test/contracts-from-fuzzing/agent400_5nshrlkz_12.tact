struct OptA {
    val: Int?;
}
struct OptB {
    optA: OptA?;
}
struct OptC {
    optB: OptB?;
}
contract TestDeepOptionContract {
    data: OptC;

    init() {
        self.data = OptC {
            optB: null
        };
    }

    receive() {
        if (self.data.optB != null) {
            let innerA = self.data.optB!!.optA;
            if (innerA != null) {
                let _ = innerA!!.val;
            }
        }
    }
}