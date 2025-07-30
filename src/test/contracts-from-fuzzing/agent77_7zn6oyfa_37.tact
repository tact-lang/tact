// Optional then nested then optional
struct In {
 a: Int?;
}

struct Mid {
 x: In;
 y: Bool?;
}

contract MidOpt {
 m: Mid;
 init() {
    self.m = Mid { x: In{ a:null }, y:null };
 }
}