struct WithFlags {
    active: Bool;
    enabled: Bool;
    deleted: Bool;
}

contract FlagsContainer {
    flags: WithFlags;
    init() {
        self.flags = WithFlags{
            active:true, enabled:false, deleted:true
        };
    }
}