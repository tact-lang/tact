struct Details {
    score: Int as uint8;
    note: String?;
}

contract Mixed {
    count: Int as uint8 = 7;
    info: Details? = null;
    detail2: Details = Details{ score: 3, note: null };
}