struct Level3 { 
    deep: Int?; 
}

struct Level2 { 
    lvl3: Level3; 
}

struct Level1 { 
    lvl2: Level2; 
}

contract DeepStructs {
    root: Level1;

    init() {
        self.root = Level1{
            lvl2: Level2{
                lvl3: Level3{ deep: 123 }
            }
        };
    }
}