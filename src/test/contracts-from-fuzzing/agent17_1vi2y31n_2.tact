struct NestedInner { flag: Bool; text: String }
struct NestedOuter { num: Int; inner: NestedInner }

contract DeepContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{ num: 42, inner: NestedInner{ flag: true, text: "deep" } };
    }
}