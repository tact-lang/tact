struct HasLongStr {
    msg: String = "a very very very long string just to fuzz the limits of storage serialization";
}

contract LongStringDefault {
    val: HasLongStr = HasLongStr{};
}
