struct InnerWithDefaultOpt {
    name: String = "anon";
    nick: String?;
}

contract NestedDefaultOptional {
    profile: InnerWithDefaultOpt;

    init() {
        self.profile = InnerWithDefaultOpt{ nick:null };
    }
}