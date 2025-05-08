struct Banner {
    title: String = "Hello";
    subtitle: String = "World";
}

contract TestContract {
    banner: Banner;

    init() {
        self.banner = Banner{
            title: "Bonjour",
            subtitle: "Monde"
        };
    }
}