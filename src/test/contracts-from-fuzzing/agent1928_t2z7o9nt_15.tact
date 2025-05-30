struct OptChain1 { f: Int?; }
struct OptChain2 { f: OptChain1?; }
struct OptChain3 { f: OptChain2?; }

contract OptNullableNested {
    state: OptChain3;

    init() {
        self.state = OptChain3{ f: null };
    }
}