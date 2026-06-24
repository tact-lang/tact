struct Embed {
    val: Int;
}

contract TestContract {
    optEmbed: Embed?;

    init() {
        self.optEmbed = null;
    }
}