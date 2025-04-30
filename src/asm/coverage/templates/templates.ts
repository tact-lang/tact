export const MAIN_TEMPLATE = `<!doctype html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Code Coverage Report</title>
        <style>
            :root {
                --covered-bg: #ddffdd;
                --uncovered-bg: #fffcdd;
                --covered-dark: #6bcc6b;
                --uncovered-dark: #ffcc00;
                --gas-color: #e60f0f;
                --hits-color: #0078d7;
                --line-color: #888;
                --line-bg: #f8f8f8;
                --line-border: #ddd;
            }

            body {
                font-family: system-ui, Avenir, Helvetica, Arial, sans-serif;
                margin: 0;
                padding: 0;
                line-height: 1.5;
            }

            .summary {
                padding: 20px;
                border-bottom: 1px solid #eee;
                background-color: #fff;
                margin-bottom: 20px;
            }

            .summary h1 {
                margin-top: 0;
                margin-bottom: 20px;
            }

            .stats {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-item {
                padding: 15px;
                background-color: #f9f9f9;
                border-radius: 5px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .stat-label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            .stat-value {
                font-size: 1.5rem;
                font-weight: 600;
            }

            .progress-bar {
                height: 8px;
                background-color: #eee;
                border-radius: 4px;
                overflow: hidden;
                margin-top: 10px;
            }

            .progress {
                height: 100%;
                background-color: var(--covered-dark);
            }

            .instructions-section {
                background-color: #f9f9f9;
                border-radius: 5px;
                padding: 15px;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            }

            .instructions-section h2 {
                margin-top: 0;
                margin-bottom: 0;
                font-size: 1.2rem;
                display: inline-block;
            }

            .toggle-icon {
                font-size: 0.8rem;
                vertical-align: middle;
                transition: transform 0.3s ease;
            }

            details[open] .toggle-icon {
                transform: rotate(180deg);
            }

            summary {
                cursor: pointer;
                user-select: none;
            }

            summary::-webkit-details-marker {
                display: none;
            }

            .instructions-content {
                margin-top: 15px;
                overflow-x: auto;
            }

            table {
                width: 100%;
                border-collapse: collapse;
            }

            thead th {
                text-align: left;
                padding: 8px;
                background-color: #f0f0f0;
            }

            tbody td {
                padding: 8px;
                border-top: 1px solid #eee;
            }

            .sortable {
                cursor: pointer;
                position: relative;
                padding-right: 20px;
            }

            .sort-icon {
                font-size: 0.8rem;
                margin-left: 5px;
                color: #aaa;
            }

            th.sort-asc .sort-icon::after {
                content: "↑";
                color: #333;
            }

            th.sort-desc .sort-icon::after {
                content: "↓";
                color: #333;
            }

            .percent-container {
                display: flex;
                flex-direction: column;
                gap: 4px;
            }

            .percent-bar {
                height: 8px;
                background-color: #eee;
                border-radius: 4px;
                overflow: hidden;
            }

            .percent-fill {
                height: 100%;
                background-color: var(--covered-dark);
            }

            code {
                font-family: monospace;
                font-size: 0.9rem;
                background-color: rgba(0, 0, 0, 0.05);
                padding: 2px 6px;
                border-radius: 3px;
            }

            .code-container {
                margin: 20px;
                border: 1px solid var(--line-border);
                border-radius: 5px;
                overflow: hidden;
            }

            .line {
                display: flex;
                align-items: stretch;
                padding: 0;
                border-bottom: 1px solid rgba(0, 0, 0, 0.05);
                position: relative;
            }

            .line-number {
                width: 3rem;
                min-width: 3rem;
                text-align: right;
                color: var(--line-color);
                user-select: none;
                border-right: 1px solid var(--line-border);
                background-color: var(--line-bg);
                padding: 2px 10px;
                display: flex;
                align-items: center;
                justify-content: flex-end;
                font-family: monospace;
                font-size: 0.9rem;
                position: sticky;
                left: 0;
                z-index: 1;
            }

            .line pre {
                margin: 0;
                font-size: 0.9rem;
                padding: 2px 10px;
                flex-grow: 1;
                overflow-x: auto;
            }

            .line .gas {
                font-family: system-ui, Avenir, Helvetica, Arial, sans-serif;
                text-align: right;
                color: var(--gas-color);
                width: 60px;
                min-width: 60px;
                padding: 0 5px;
                font-size: 0.85rem;
                background-color: rgba(0, 0, 0, 0.03);
                display: flex;
                align-items: center;
                justify-content: flex-end;
            }

            .line .hits {
                font-family: system-ui, Avenir, Helvetica, Arial, sans-serif;
                text-align: center;
                color: var(--hits-color);
                width: 40px;
                min-width: 40px;
                font-size: 0.85rem;
                background-color: rgba(0, 0, 0, 0.03);
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .Covered {
                background-color: var(--covered-bg);
                position: relative;
                overflow: hidden;
            }

            .Covered > pre::before {
                content: "";
                position: absolute;
                top: 0;
                right: 0;
                bottom: 0;
                width: var(--gas-percent, 0%);
                background-color: rgba(107, 204, 107, 0.4);
                z-index: 0;
                transition: width 0.3s ease;
                border-right: 1px dashed rgba(107, 204, 107, 0.8);
            }

            .Covered:hover::after {
                content: attr(data-gas-percent);
                position: absolute;
                right: 5px;
                top: 2px;
                font-size: 0.75rem;
                color: #555;
                background-color: rgba(255, 255, 255, 0.8);
                padding: 0 5px;
                border-radius: 2px;
                z-index: 2;
            }

            .line-number,
            .gas,
            .hits,
            .line pre {
                position: relative;
                z-index: 1;
            }

            .Uncovered {
                background-color: var(--uncovered-bg);
            }

            .Skipped {
            }

            a {
                color: #0078d7;
                text-decoration: none;
            }

            a:hover {
                text-decoration: underline;
            }

            .options {
                margin: 10px 20px;
                padding: 5px 0;
                border-bottom: 1px solid #eee;
            }

            .option-label {
                display: inline-flex;
                align-items: center;
                cursor: pointer;
                user-select: none;
                margin-right: 20px;
            }

            .option-checkbox {
                margin-right: 5px;
            }

            .option-text {
                font-size: 0.9rem;
                color: #666;
            }

            /* Total gas styles */
            .gas-sum {
                display: none;
            }

            .gas-detailed {
                display: inline-block;
            }

            .show-total-gas .gas-sum {
                display: inline-block;
            }

            .show-total-gas .gas-detailed {
                display: none;
            }
        </style>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const table = document.getElementById("instructionsTable")
                const headers = table.querySelectorAll("th.sortable")

                headers.forEach(header => {
                    header.addEventListener("click", function () {
                        const column = this.dataset.column
                        const isAsc = this.classList.contains("sort-asc")

                        // Remove sort classes from all headers
                        headers.forEach(h => {
                            h.classList.remove("sort-asc", "sort-desc")
                        })

                        // Set sort class for clicked header
                        this.classList.add(isAsc ? "sort-desc" : "sort-asc")

                        // Get rows and sort
                        const tbody = table.querySelector("tbody")
                        const rows = Array.from(tbody.querySelectorAll("tr"))

                        const sortedRows = rows.sort((a, b) => {
                            const aValue = a.querySelector(
                                \`td[data-value]:nth-child($\{getColumnIndex(column)})\`,
                            ).dataset.value
                            const bValue = b.querySelector(
                                \`td[data-value]:nth-child($\{getColumnIndex(column)})\`,
                            ).dataset.value

                            // Check if values are numeric
                            const aNum = !isNaN(aValue)
                            const bNum = !isNaN(bValue)

                            let comparison
                            if (aNum && bNum) {
                                comparison = parseFloat(aValue) - parseFloat(bValue)
                            } else {
                                comparison = aValue.localeCompare(bValue)
                            }

                            return isAsc ? comparison : -comparison
                        })

                        // Clear and append sorted rows
                        while (tbody.firstChild) {
                            tbody.removeChild(tbody.firstChild)
                        }

                        sortedRows.forEach(row => {
                            tbody.appendChild(row)
                        })
                    })
                })

                function getColumnIndex(column) {
                    const columns = {
                        name: 1,
                        gas: 2,
                        hits: 3,
                        avgGas: 4,
                        percent: 5,
                    }
                    return columns[column]
                }

                document.getElementById("showTotalGas").addEventListener("change", function () {
                    const codeContainer = document.querySelector(".code-container")
                    if (this.checked) {
                        codeContainer.classList.add("show-total-gas")
                    } else {
                        codeContainer.classList.remove("show-total-gas")
                    }
                })

                const progressBar = document.getElementById("coverage-progress")
                const coveragePercentage = document
                    .querySelector(".stat-value")
                    .innerText.replace("%", "")
                if (progressBar && coveragePercentage) {
                    progressBar.style.width = \`$\{coveragePercentage}%\`
                }
            })
        </script>
    </head>
    <body>
        {{SUMMARY_CONTENT}}

        <div class="options">
            <label class="option-label">
                <input type="checkbox" id="showTotalGas" class="option-checkbox" />
                <span class="option-text">Show total gas per line</span>
            </label>
        </div>

        <div class="code-container">{{CODE_CONTENT}}</div>
    </body>
</html>
`;

export const SUMMARY_TEMPLATE = `<div class="summary">
    <h1>Coverage Report</h1>
    <div class="stats">
        <div class="stat-item">
            <span class="stat-label">Coverage:</span>
            <span class="stat-value">{{coverage_percentage}}%</span>
            <div class="progress-bar">
                <div class="progress" id="coverage-progress"></div>
            </div>
        </div>
        <div class="stat-item">
            <span class="stat-label">Lines:</span>
            <span class="stat-value">{{covered_lines}}/{{total_lines}}</span>
        </div>
        <div class="stat-item">
            <span class="stat-label">Total Gas Used:</span>
            <span class="stat-value">{{total_gas}}</span>
        </div>
        <div class="stat-item">
            <span class="stat-label">Instructions Executed:</span>
            <span class="stat-value">{{total_hits}}</span>
        </div>
    </div>
    <div class="instructions-section">
        <details>
            <summary>
                <h2>Instruction Statistics <span class="toggle-icon">▼</span></h2>
            </summary>
            <div class="instructions-content">
                <table id="instructionsTable">
                    <thead>
                        <tr>
                            <th class="sortable" data-column="name">
                                Instruction <span class="sort-icon">↕</span>
                            </th>
                            <th class="sortable" data-column="gas">
                                Total Gas <span class="sort-icon">↕</span>
                            </th>
                            <th class="sortable" data-column="hits">
                                Hits <span class="sort-icon">↕</span>
                            </th>
                            <th class="sortable" data-column="avgGas">
                                Avg Gas <span class="sort-icon">↕</span>
                            </th>
                            <th class="sortable" data-column="percent">
                                % of Total Gas <span class="sort-icon">↕</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        {{instruction_rows}}
                    </tbody>
                </table>
            </div>
        </details>
    </div>
</div>`;
