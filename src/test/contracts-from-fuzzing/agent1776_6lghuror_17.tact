// Workaround optional chain: no optional chaining use explicit null check
struct InnerData {
    d1: Int?;
    d2: Bool?;
}

struct MidData {
    mid1: InnerData?;
    mid2: String;
}

struct OuterData {
    top: MidData?;
    count: Int;
}

contract TestContract {
    model: OuterData;

    init() {
        self.model = OuterData {
            top: MidData {
                mid1: InnerData{d1: null, d2: null},
                mid2: "x"
            },
            count: 5
        };
    }

    receive() {
        let topVal = self.model.top;
        if (topVal != null) {
            let mid1Val = topVal!!.mid1;
            if (mid1Val != null) {
                let _ = mid1Val!!.d2;
            }
        }
    }
}