struct Deep {
    lev1: Int;
    lev2: Int;
    lev3: Int;
    lev4: Int;
    lev5: Int;
}

contract TestContract {
    deep: Deep = Deep{
        lev1:1, lev2:2, lev3:3, lev4:4, lev5:5
    };
}