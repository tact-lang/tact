struct DefaultsVsNulls {
    v1: Int?;               // defaults to null
    v2: Int? = null;       // explicit null default
    v3: String? = null;
    v4: Bool?;             // defaults null
    v5: Bool = true;
}

contract ComboOptional {
    data: DefaultsVsNulls;

    init() {
        self.data = DefaultsVsNulls{};
    }
}