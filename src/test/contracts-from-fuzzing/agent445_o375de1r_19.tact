// Contract persistent field with nested struct with optional with default
struct Config {
    retry: Int? = null;
}

contract OptDefNested {
    state: Config = Config{};
}
