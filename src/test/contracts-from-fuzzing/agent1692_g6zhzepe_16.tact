struct SA {a: Int;}
struct SB {b: SA;}
struct SC {c: SB;}
struct SD {d: SC;}
struct SE {e: SD;}
struct SF {f: SE;}
struct SG {g: SF;}

contract Deep7 {
    field: SG = SG{ g: SF{ f: SE{ e: SD{ d: SC{ c: SB{ b: SA{ a: 42 } }}}}}};
}