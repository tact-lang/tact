struct Compose1 { s: String }
struct Compose2 { c: Compose1 }
contract TestContract {
    data: Compose2?;
    init() {
        self.data = null;
    }
}