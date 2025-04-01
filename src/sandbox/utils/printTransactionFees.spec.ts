import { formatCoinsPure } from "@/sandbox/utils/printTransactionFees";

describe("formatCoins", () => {
    it("should format coins correctly", () => {
        expect(formatCoinsPure(1000000000n)).toBe("1");

        // rounding
        expect(formatCoinsPure(1n)).toBe("0.000001");
        expect(formatCoinsPure(1000000001n)).toBe("1.000001");
        expect(formatCoinsPure(1000000100n)).toBe("1.000001");
        expect(formatCoinsPure(1000001000n)).toBe("1.000001");

        expect(formatCoinsPure(1999999001n)).toBe("2");
        expect(formatCoinsPure(1499999001n)).toBe("1.5");
        expect(formatCoinsPure(1999499001n)).toBe("1.9995");
        expect(formatCoinsPure(1234567891n)).toBe("1.234568");

        expect(formatCoinsPure(1n, 1)).toBe("0.1");
        expect(formatCoinsPure(1n, 0)).toBe("1");

        expect(formatCoinsPure(0n)).toBe("0");
        expect(formatCoinsPure(0n, 1)).toBe("0");
        expect(formatCoinsPure(0n, 0)).toBe("0");

        expect(formatCoinsPure(1234000000n)).toBe("1.234");
    });
});
