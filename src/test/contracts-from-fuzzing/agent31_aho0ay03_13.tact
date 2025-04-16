struct OptChain4 { val: Int; }
struct OptChain3 { next: OptChain4?; }
struct OptChain2 { next: OptChain3?; }
struct OptChain1 { next: OptChain2?; }

contract TestContract {
    state: OptChain1?;

    init() {
        self.state = null;
    }
}
