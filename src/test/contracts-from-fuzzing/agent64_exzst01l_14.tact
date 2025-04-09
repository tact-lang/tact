struct Particle { energy: Int }

contract TestDestructuringAssignment {
    receive() {
        // Destructuring assignment with a nested arithmetic expression
        let Particle { energy } = Particle { energy: (10 + 5) * 2 }; // expected energy = 30
        dump(energy);
    }
}
