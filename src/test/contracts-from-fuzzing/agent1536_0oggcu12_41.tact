// Compose deep nested optionals where innermost is primitive optional
struct Host {
    child: Child?;
}

struct Child {
    val: Int?;
}

contract HostContract {
    field: Host;

    init() {
        self.field = Host{ child: null };
    }
}