struct Config {
    owner: Address;
    limit: Int?;
    active: Bool;
}

struct Settings {
    config: Config?;
    description: String?;
    codeHash: Cell;
}

contract ComboStructs {
    settings: Settings;

    init() {
        self.settings = Settings{
            config: null,
            description: null,
            codeHash: emptyCell(),
        };
    }
}