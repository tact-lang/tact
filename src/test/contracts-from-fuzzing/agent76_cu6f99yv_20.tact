struct OptionEmbed {
    inner: Int?;
}

contract OptDefault {
    data: OptionEmbed = OptionEmbed{ inner: null };
}