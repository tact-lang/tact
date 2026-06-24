struct HasSpecializations {
    small: Int as uint8;
    med: Int as int32;
    coin: Int as coins;
}

contract SerializationFormats {
    data: HasSpecializations;

    init() {
        self.data = HasSpecializations{ small: 3, med: -1000, coin: 1000000000 };
    }
}