struct StringChain1 { next: String; }
struct StringChain2 { next: StringChain1; }
struct StringChain3 { next: StringChain2; }

contract ChainStrings {
    f: StringChain3;

    init() {
        self.f = StringChain3{ next: StringChain2{ next: StringChain1{ next: "end" } } };
    }
}