// eslint-disable-next-line @typescript-eslint/no-var-requires
import Coverage from "@tact-lang/coverage";

export default async () => {
    if (process.env.COVERAGE === "true") {
        Coverage.beginCoverage();
    }
};
