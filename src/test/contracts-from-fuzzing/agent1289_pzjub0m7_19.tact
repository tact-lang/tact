contract PersistentOverride {
    yes: Bool = false;
    greeting: String = "bye";

    init() {
        self.yes = true;
        self.greeting = "hello";
    }
}