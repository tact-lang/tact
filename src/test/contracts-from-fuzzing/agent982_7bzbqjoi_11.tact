struct NestedString {
    txt: String;
}

struct WrapString {
    nest: NestedString;
}

contract StringStorageContract {
    data: WrapString;

    init() {
        self.data = WrapString{
            nest: NestedString{
                txt: "testing"
            }
        };
    }
}