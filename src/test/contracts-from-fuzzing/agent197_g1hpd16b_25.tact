struct WeirdWidths {
    a: Int as int5 = 3;
    b: Int as uint3 = 2;
    c: Int as int6 = -1;
}

contract WeirdWidthsHolder {
    w: WeirdWidths = WeirdWidths{ a: 3, b: 2, c: -1 };
}