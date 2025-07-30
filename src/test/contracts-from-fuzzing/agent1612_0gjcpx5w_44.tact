// optional struct default null in contract fields
struct Wrapper { str: String }

contract OptionalWithDefault {
    field: Wrapper? = null;

    init() {
        // keep null
    }
}
